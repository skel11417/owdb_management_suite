class StatisticsController < ApplicationController


  def index

  end

  def states
    @state_ranking = State.ranking
    @pod_count = pod_count_float
  end

  def grantees
    @grantee_ranking = Grantee.ranking
    @pod_count = pod_count_float
  end

  private

  def pod_count_float
    Pod.count.to_f
  end
end
