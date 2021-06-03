class UpdateQuestionJob < ApplicationJob
  retry_on Net::OpenTimeout, Timeout::Error, wait: 5.seconds

  def perform(sighting_id)
    sight = Sighting.find(sighting_id)
    quest = JSON.parse(Net::HTTP.get(URI('https://opentdb.com/api.php?amount=1&category=18&difficulty=medium')))['results'][0]['question']
    sight.update_attribute(:question, quest)
  end
end
