class PagesController < ApplicationController
  before_filter :authenticate_player!, :only =>[:checkpointsMap]

  def home
    @units = Unit.all
  end

  def profile
  end

  def treasureHunties
    @game = Game.find(params[:game_id])
    @game_invention = Invention.find(@game.invention_id)
    gon.game = @game
  end

  def collectedInventions
    @player = current_player
    @microscopes_inventions = @player.inventions.where(:category => "Microscopes")
    @magnets_inventions = @player.inventions.where(:category => "Magnets")
    @food_chain_inventions = @player.inventions.where(:category => "Food Chain")
  end

  def topPlayers
  end

  def help
  end

  def play
    @city = City.find(params[:city_id])
    gon.city = @city

    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    gon.checkpoint = @checkpoint

    @game = Game.find(params[:game_id])
    @game.city_id = @city.id
    gon.game = @game
    @game.save

    # Fetching Questions for game
    @educational_level = @checkpoint.educational_level_id
    @lessons = @game.lessons.pluck(:id)
    @questions = Question.where(lesson_id: @lessons, educational_level: @educational_level)
    gon.questions = @questions

    # Fetching Questions Locations
    @locations = QuestionLocation.where(city_id: @city.id)
    gon.locations = @locations

    @game_invention = Invention.find(@game.invention_id)
    case @checkpoint.id
    when 1
      @part = @game_invention.part1
    when 2
      @part = @game_invention.part2
    when 3
      @part = @game_invention.part3
    when 4
      @part = @game_invention.part4    
    when 5
      @part = @game_invention.part5
    when 6
      @part = @game_invention.part6           
    end

    #update score
    @game.score = params[:score]
    @game.correct_questions = params[:correct_questions]
    @game.save
  end

  def information
    @game = Game.find(params[:game_id])
    @game_invention = Invention.find(@game.invention_id)
  end

  def checkpointsMap
    @checkpoints = Checkpoint.all 

    if (params[:game_id].present?)
      @game = Game.find(params[:game_id])
    end

    if(params[:game].present?)
      # Fetching random invention
      @inventions = Invention.all.pluck(:id)
      random = rand(1..@inventions.length)
      @game_invention = Invention.find(random)    

      @game = Game.new
      @game.mode = params[:mode]
      @game.invention_id = @game_invention.id

      if(player_signed_in?)
        @game.player_id = current_player.id
      end

      @game.save

      @lessons = Lesson.find params[:game][:lesson_ids].split(',')
      @game.lessons << @lessons

      @player = current_player
      @player.inventions << @game_invention
    end
  end
end
