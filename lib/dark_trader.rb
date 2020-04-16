require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

crypto_name_array = []
crypto_price_array = []

for iterator in 1..200
    crypto_name_array << page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{iterator}]/td[3]/div").text
end

for iterator in 1..200
    crypto_price_array << page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{iterator}]/td[5]/a").text
end

# print crypto_name_array
# print crypto_price_array
final_array = []

final_array << Hash[crypto_name_array.zip(crypto_price_array)]
puts "voici mon tableau combine : #{final_array}"
