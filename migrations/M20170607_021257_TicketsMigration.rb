require 'migrations/migration'

class M20170607_021257_TicketsMigration < Migration
  def up
		@db.create_table :tickets do
			float :price, :null => false
			String :from, :null => false
			String :to, :null => false
			String :image, :null => false
			String :company, :null => false
			String :url, :null => false
			String :departure_date, :null => false
		end

		execute %q{
			LOAD DATA LOCAL INFILE 'tickets.csv'
			INTO TABLE tickets
			CHARACTER SET utf8
			FIELDS TERMINATED BY ';'
			ENCLOSED BY '"'
			LINES TERMINATED BY '\n'
			IGNORE 1 LINES;
		}
	end

	def down
		@db.drop_table :tickets
	end
end