class GameEndWorker
  include Sidekiq::Worker

  sidekiq_options retry: false
  
  def perform(data)
  	data = JSON.parse(data)
    game = Game.where(uuid: data['game_uuid']).first
    game.analize(data['winners'])
  end
  
end