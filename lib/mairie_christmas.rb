require 'rubygems'
require 'nokogiri'   
require 'open-uri'

# recuperer l'email de la mairie a partir de son url 
def get_townhall_email(url)
    page = Nokogiri::HTML(open(url))
    return page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

# recuperer tous les liens url pour se deplacer de page en page 
def get_townhall_urls
    page_list_department = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    get_townhall_url = []
    page_list_department.xpath('//a[@class="lientxt"]/@href').each do |url|
        get_townhall_url << "http://annuaire-des-mairies.com#{url.to_s[1..-1]}"
    end
    return get_townhall_url
end
#puts get_townhall_urls

#fonction pour recuperer tous les emails des maires du 95
def get_all_emails
    townhall_urls = get_townhall_urls
    array_of_emails = []
    hashObject = Hash.new
    townhall_urls.each do |url|        
        hashObject[url.to_s] = get_townhall_email(url.to_s)
    end

    return hashObject
end 

puts "voici mon tableau combine : #{get_all_emails}"

#puts get_townhall_email("https://www.annuaire-des-mairies.com/95/ambleville.html")
