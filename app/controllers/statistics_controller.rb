class StatisticsController < ApplicationController
  def index

  end

  def states
    @state_ranking = State.ranking
  end

  def grantees
    @grantee_ranking = Grantee.ranking
  end
end
