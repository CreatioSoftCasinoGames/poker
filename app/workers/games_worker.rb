class GamesWorker
  include Sidekiq::Worker

  sidekiq_options retry: false
  
  def perform(data)
    Game.create(JSON.parse(data))
  end
  
end