require 'net/http'
require 'capybara'
require 'capybara/dsl'

namespace :crawl do
  task :crawl_counties => :environment do
    include Capybara::DSL
    Capybara.current_driver = :selenium_chrome
    page.visit "http://map.ezship.com.tw/ezship_map_web_2014.jsp"
    find("#ui-id-3").click
    sleep(3)
    page_no = Nokogiri::HTML(page.html)
    puts page_no
    sleep(3)
    buttons = page_no.css("#thisMainArea").css("span")
    buttons.each do |button|
      puts button.children.to_s
      county = County.new
      county.name = button.children.to_s
      county.save!
    end
  end

  task :crawl_towns => :environment do
    include Capybara::DSL
    Capybara.current_driver = :selenium_chrome
    page.visit "http://map.ezship.com.tw/ezship_map_web_2014.jsp"
    find("#ui-id-3").click
    sleep(3)
    County.all.each do |county|
      find_button("#{county.name}").click
      sleep(3)
      page_no = Nokogiri::HTML(page.html)
      page_no.css("#thisMainArea button").css("span").last.remove
      buttons = page_no.css("#thisMainArea button").css("span")
      buttons.each do |button|
        puts button.children.to_s
        town = Town.new
        town.county_id = county.id
        town.name = button.children.to_s
        twon.save!
      end

      find_button("上一步").click
    end
  end

  task :crawl_roads => :environment do
    include Capybara::DSL
    Capybara.current_driver = :selenium_chrome
    page.visit "http://map.ezship.com.tw/ezship_map_web_2014.jsp"
    find("#ui-id-3").click
    sleep(3)
    Count.all.each do |county|
      find_button("#{county.name}").click
      sleep(3)
      towns = county.towns
      towns.each do |town|
        find_button("#{town.name}").click
        sleep(3)
        page_no = Nokogiri::HTML(page.html)
        page_no.css("#thisMainArea button").css("span").last.remove
        buttons = page_no.css("#thisMainArea button").css("span")
        buttons.each do |button|
          puts button.children.to_s
          road = Road.new
          road.town_id = town.id
          road.name = button.children.to_s
          road.save!
        end

        find_button("上一步").click
      end

      find_button("上一步").click
    end
  end

  task :crawl_stores => :environment do
    include Capybara::DSL
    Capybara.current_driver = :selenium_chrome
    page.visit "http://map.ezship.com.tw/ezship_map_web_2014.jsp"
    find("#ui-id-3").click
    sleep(3)
    County.all.each do |county|
      find_button("#{county.name}").click
      sleep(3)
      towns = county.towns
      towns.each do |town|
        find_button("#{town.name}").click
        sleep(3)
        roads = town.roads
        roads.each do |road|
          find_button("#{road.name}").click
          sleep(3)
          begin
            find_button("關閉").click
          rescue Eception => e
          end

          page_no = Nokogiri::HTML(page.html)
          stores = page_no.css(".cssTR")
          stores.each do |store|
            store_name = store.css(".cssTDTitle").children[0].to_s
            store_code = store.css(".cssTDData")[0].children[0].to_s.gsub("門市服務代號:", "")
            store_address = store.css(".cssTDData")[1].children[0].to_s.gsub("地址：", "")
            store_phone = store.css(".cssTDData")[2].children[0].to_s.gsub("電話：", "")
            pust store_name
            puts store_code
            puts store_address
            puts store_phone
            the_store = Store.new
            the_store.county_id = county.id
            the_store.town_id = town.id
            the_store.road_id = road.id
            the_store.store_code = store_code
            the_store.name = store_name
            the_store.address = store_address
            the_store.phone = store_phone

            if store_name.index("全家")
              the_store.store_type = 1
            elsif store_name.index("OK")
              the_store.store_type = 2
            elsif store_name.index("萊爾富")
              the_store.store_type = 3                      
            end

            the_store.save!
          end

          find_button("上一步").click
          sleep(3)
        end

        find_button("上一步").click
        sleep(3)
      end

      find_button("上一步").click
      sleep(3)
    end
  end
end