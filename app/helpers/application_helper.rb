module ApplicationHelper
    def locale
        I18n.locale == :en ? "Inglês" : "Português Brasil"
    end

    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end

    def name_app
        "crypto wallet"
    end
end
