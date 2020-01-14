# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas")
spinner.auto_spin

coins = [
    {
        description: "Bitcoin" ,
        acronym: "BTC",
        url_image: "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/45_Bitcoin_logo_logos-512.png"
    },
    
    {
        description: "Ethereum" ,
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
    },

    {
        description: "Dash" ,
        acronym: "DASH",
        url_image: "https://i.pinimg.com/originals/b0/f5/ff/b0f5ff13b6449d68d7038bee35a1c6eb.png"
    }
    ]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

=begin
Coin.create!(
    [
    {
        description: "Bitcoin" ,
        acronym: "BTC",
        url_image: "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/45_Bitcoin_logo_logos-512.png"
    },
    
    {
        description: "Ethereum" ,
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
    },

    {
        description: "Dash" ,
        acronym: "DASH",
        url_image: "https://i.pinimg.com/originals/b0/f5/ff/b0f5ff13b6449d68d7038bee35a1c6eb.png"
    }
    ]
)
=end
spinner.success('(Concluído)')
