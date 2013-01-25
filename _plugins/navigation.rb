module Jekyll
    class SiteNavigation < Jekyll::Generator
        safe true
        priority :lowest

        def generate(site)
            sorted = []
            site.pages.each do |page|
                sorted << page if page.data["navigation"] != nil and page.data["navigation"] != 0
            end
            sorted = sorted.sort{ |a,b| a.data["navigation"] <=> b.data["navigation"] } 
            site.config["navigation"] = sorted
        end
    end
end
