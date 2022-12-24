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
		@search_query = ''
		if params[:search_query_01].present?
			@keyword1 = "APEX" + @rank + params[:search_query_01]
      @youtube_data = find_videos(@keyword1)
		end

		if params[:search_query_02].present?
      @keyword2 = "APEX" + @rank + params[:search_query_02]
      @youtube_data2 = find_videos(@keyword2)
		end

		if params[:search_query_03].present?
      @keyword3 = "APEX" + @rank + params[:search_query_03]
      @youtube_data3 = find_videos(@keyword3)
		end

		if params[:search_query_04].present?
      @keyword4 = "APEX" + @rank + params[:search_query_04]
      @youtube_data4 = find_videos(@keyword4)
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

