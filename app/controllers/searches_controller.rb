  require 'google/apis/youtube_v3'
  require 'active_support/all'

  class SearchesController < ApplicationController
  GOOGLE_API_KEY = "AIzaSyBUsCWjX4xx51cN810jaw2G65VFNx7MaHo"

  def index
		@rank = "ブロンズ"
		@search_query = "撃ち合い"
		@keyword = "APEX" + @rank + @search_query

		@youtube_data = find_videos(@keyword)
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
		results = service.list_searches(:snippet, opt)
		results.items.each do |item|
			id = item.id
			snippet = item.snippet
			puts "\"#{snippet.title}\" by #{snippet.channel_title} (id: #{id.video_id}) (#{snippet.published_at})"
		end
	end
end

