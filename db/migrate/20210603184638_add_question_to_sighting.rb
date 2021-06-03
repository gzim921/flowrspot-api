class AddQuestionToSighting < ActiveRecord::Migration[6.1]
  include HTTParty

  def self.up
    change_table :sightings do |t|
      t.string :question
    end

    sightings = select_all("SELECT id FROM sightings WHERE question IS NULL")
    question_count = sightings.count
    questions = HTTParty.get("https://opentdb.com/api.php?amount=#{question_count}&category=18&difficulty=medium")
                        .parsed_response["results"].map{ |i| i["question"] }

    sightings.each_with_index do |sight,index|
      update <<-SQL.squish
        UPDATE sightings
        SET question = '#{questions[index]}'
        WHERE id = '#{sight['id']}'
      SQL
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :question
    end
  end
end