require 'csv'

{
  "Elsa" => [
    {
      week: 1,
      day: "Monday",
      mode: "Drive",
      inbound: 30,
      outbound: 50,
      distance: 24
    },
    {
      week: 1,
      day: "Tuesday",
      mode: "Drive",
      inbound: 35,
      outbound: 52,
      distance: 24
    },
  ]
}


commute_csv = CSV.open('gschool_commute_data.csv', headers:true, header_converters: :symbol)
# p CSV.read('gschool_commute_data.csv').length
new_commute_csv =  (commute_csv.map {|row| row.to_hash}).group_by { |row| row[:person] }

new_commute_csv.each do |name, commutes|
   commutes.map! { |commute| commute.delete(:person); commute }
end

new_commute_csv


# * For Week 4 on Wednesday, what was Nate's inbound commute time?

new_commute_csv["Nate"].each do |commutes|

  if commutes[:week] == "4" && commutes[:day] == "Wednesday"
  p  commutes[:inbound]
  end

end


# * For all 5 weeks, what was the group average commute time?

commute_time = 0
count = 0
new_commute_csv.each do |name, commutes|
   commutes.each do |commute|
   # if commute[:week] == "5"
     count += 2
    commute_time += (commute[:inbound].to_i + commute[:outbound].to_i)
   # end
  end
end

p avg_time = commute_time/count

# * Who walked the fastest to gSchool during the 5 weeks? What was their average speed?

new_commute_csv.each do |name, commutes|
 commutes.each do |commute|
   if commute[:mode] == "Walk"
     name
   end

 end
end

commute_time = 0
count = 0
new_commute_csv["Emily"].each do |commutes|
    count += 2
    commute_time += (commutes[:inbound].to_i + commutes[:outbound].to_i)
end

p avg_time_emily = commute_time/count

commute_time = 0
count = 0
new_commute_csv["Rachel"].each do |commutes|
    count += 2
    commute_time += (commutes[:inbound].to_i + commutes[:outbound].to_i)
end

p avg_time_emily = commute_time/count
