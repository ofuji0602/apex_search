  require 'google/apis/youtube_v3'
  require 'active_support/all'

  class SearchesController < ApplicationController
  GOOGLE_API_KEY = "AIzaSyBUsCWjX4xx51cN810jaw2G65VFNx7MaHo"

  def index
    case (@rank = params[:rank])
    when ("bronz") then
      @rank = "ブロンズ"
    when ("silver") then
      @rank = "シルバー"
    when ("gold") then
      @rank = "ゴールド"
    when ("platinum") then
      @rank = "プラチナ"
    when ("diamond") then
      @rank = "ダイアモンド"
    when ("master") then
      @rank = "マスター"
    else
      #(値1~3のいずれにも合致しなかった場合に実行する処理)
    end

      @results = {}
      if params[:search_query].present?
        params[:search_query].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + @rank + " " + checked_item)
        end
      end
    
      if params[:search_query_02].present?
        params[:search_query_02].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + checked_item)
        end
      end

      if params[:search_query_03].present?
        params[:search_query_03].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + checked_item + " " + "設定方法")
        end
      end

      if params[:search_query_04].present?
        params[:search_query_04].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + checked_item + " " + "使い方")
        end
      end

      if params[:search_query_05].present?
        params[:search_query_05].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + checked_item + " " + "リコイル制御")
        end
      end

      if params[:search_query_06].present?
        params[:search_query_06].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + checked_item + " " + "マップ解説")
        end
      end

      if params[:search_query_06].present?
        params[:search_query_06].each do |checked_item|
          @results[checked_item] = find_videos("APEX" + " " + checked_item + " " + "やり方")
        end
      end
    end

	private

	def find_videos(keyword, after: 1.months.ago, before: Time.now) #検索キーワードと検索範囲を変えれるように引数に値を取っています
		service = Google::Apis::YoutubeV3::YouTubeService.new
		service.key = GOOGLE_API_KEY
		next_page_token = nil
		opt = {
			q: keyword,
			type: 'video',
			max_results: 2,
			order: :date,
			page_token: next_page_token
		}
		results = service.list_searches(:snippet, **opt)
		results.items.each do |item|
			id = item.id
			snippet = item.snippet
			puts "\"#{snippet.title}\" by #{snippet.channel_title} (id: #{id.video_id}) (#{snippet.published_at})"
		end
	end
end

