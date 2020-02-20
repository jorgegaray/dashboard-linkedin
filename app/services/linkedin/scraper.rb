require 'pincers'

class Linkedin::Scraper
    def self.scrapeCompany company_name
        results = Array.new
        
        Pincers.for_webdriver :chrome do |pincers|
            pincers.goto "https://www.linkedin.com"
            pincers.search("input[name=session_key]").set("ceel2004@hotmail.com")
            pincers.search("input[name=session_password]").set("ClaveSegura1990")
            pincers.search("form[action='https://www.linkedin.com/uas/login-submit']").submit
            
            name = pincers.search("div.profile-rail-card__actor-link").text
            
            pincers.goto "https://www.linkedin.com/search/results/companies/?keywords=#{company_name}&origin=HISTORY"
            
            results_items = pincers.search("li[class='search-result search-result__occluded-item ember-view']")
            results_items.each { |result_item| 
                company_data = Hash.new
                array_keys = Array.new
                array_value = Array.new
                link = result_item.search("a.search-result__result-link").attribute("href")
                name = result_item.search("h3[class='search-result__title t-16 t-black t-bold']").text
                if link.include?("/company/")
                    pincers.goto link.concat("about/")
                    
                    pincers.search("dt[class='org-page-details__definition-term t-14 t-black t-bold']").each {|item_key|
                        array_keys << item_key.text.to_s.downcase.gsub(' ','')
                    }
                    
                    pincers.search("dd[class='org-page-details__definition-text t-14 t-black--light t-normal']").each { |item_value|
                        array_value << item_value.text
                    }
                    
                    array_keys.each_with_index {|k,i|company_data[k] = array_value[i]}
                    company_data['nombre'] = name
                    results.push(company_data)
                    break
                end
                break
            }
            saveCompany(results)
        end
        
    end
    
    def self.saveCompany company_data
        data = []
        company_data.each do |company|
            unless Company.where(name: company['nombre']).empty?
              data.push(Company.where(name: company['nombre']).first)
              next
            end
            element = Company.new(get_data(company))
            element.save
            data.push(element)
        end
        data
    end

    def self.get_data company
        { 
        name: company['nombre'],
        description: company['fundación'],
        area:company['sector'],  
        web: company['sitioweb'],    
        country: 0       
        }
    end
    
end