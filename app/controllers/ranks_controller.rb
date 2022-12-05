
  require 'google/apis/youtube_v3'
  require 'active_support/all'

  class RanksController < ApplicationController
  GOOGLE_API_KEY = "AIzaSyBUsCWjX4xx51cN810jaw2G65VFNx7MaHo"

  def index
    case (@rank = params[:rank])
    when ("bronz") then
      @rank = "ブロンズ"
      @keyword = "APEX" + @rank
      @youtube_data = find_videos("APEX" + @rank)
    when ("silver") then
      @rank = "シルバー"
      @keyword = "APEX" + @rank
      @youtube_data = find_videos(@keyword)
    when ("gold") then
      @rank = "ゴールド"
      @keyword = "APEX" + @rank
      @youtube_data = find_videos(@keyword)
    when ("platinum") then
      @rank = "プラチナ"
      @keyword = "APEX" + @rank
      @youtube_data = find_videos(@keyword)
    when ("diamond") then
      @rank = "ダイアモンド"
      @keyword = "APEX" + @rank
      @youtube_data = find_videos(@keyword)
    when ("master") then
      @rank = "マスター"
      @keyword = "APEX" + @rank
      @youtube_data = find_videos(@keyword)
    else
      #(値1~3のいずれにも合致しなかった場合に実行する処理)
    end
  end

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, **opt)
  end
end