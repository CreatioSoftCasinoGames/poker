class MovesWorker
  include Sidekiq::Worker

  sidekiq_options retry: false
  
  def perform(data)
    Move.create(JSON.parse(data))
  end
  
end