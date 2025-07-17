class CsvImportUsersService
  require "csv"

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true,  col_sep: ";")

    csv.each do |row|
      user_hash = {}
      user_hash[:name] = row["First Name"]
      user_hash[:surname] = row["Last Name"]
      user_hash[:email] = row["Email Address"]
      user_hash[:phone] = row["Mobile phone number"]
      user_hash[:preferences] = row["Favorite Food"]
      user_hash[:username] = row["Email Address"].split("@").first if row["Email Address"].present?

      User.create(user_hash)
    end
  end
end
