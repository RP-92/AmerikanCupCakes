module LayoutHelper

	def site_name
		"Amerikan CupCakes"
	end

	def site_url
		if Rails.env.production?
			"http://www.amerikancupcakes.com/"
		else
			"http://localhost:3000"
		end
	end

	def meta_author
		"FullHouse"
	end

	def meta_description
		"Ordena pedidos para cócteles y fiestas con Amerikan CupCakes"
	end

	def meta_keywords
		# Aca van keywords
		"Add your keywords here"
	end

	#retorna titulo completo
	def full_title(page_title)
		if page_title.empty?
			site_name
		else
			"#{page_title} | #{site_name}"
		end
	end

end