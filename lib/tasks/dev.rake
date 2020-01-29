namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("drop") do
        %x(rails db:drop)
      end
      
      show_spinner("create") do
        %x(rails db:create)
      end

      show_spinner("migrate") do
        %x(rails db:migrate)
      end

      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      
    else
      puts "fora de ambiente de desenvolvimento"
    end
  end


  desc "Cadastro das moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas") do
    coins = [
        {
            description: "Bitcoin" ,
            acronym: "BTC",
            url_image: "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/45_Bitcoin_logo_logos-512.png",
            mining_type: MiningType.find_by(acronym: 'PoW')
        },
        
        {
            description: "Ethereum" ,
            acronym: "ETH",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
            mining_type: MiningType.all.sample
       },

        {
            description: "Dash" ,
            acronym: "DASH",
            url_image: "https://i.pinimg.com/originals/b0/f5/ff/b0f5ff13b6449d68d7038bee35a1c6eb.png",
            mining_type: MiningType.all.sample
        }
        ]

    coins.each do |coin|
        Coin.find_or_create_by!(coin)
    end
    end
  end

  desc "Cadastro dos tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastro dos tipos de mineração") do
    mining_types = [
      {description:"Proof of Work", acronym:"PoW"},
      {description:"Proof of Stake", acronym:"PoS"},
      {description:"Proof of Capacity", acronym:"PoC"}
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
    end
  end


private
  def show_spinner(msg)
    spinner = TTY::Spinner.new("[:spinner] #{msg}")
    spinner.auto_spin # Automatic animation with default interval
    sleep(2) # Perform task
    yield
    spinner.success('(Sucesso)')
  end
end
