import 'dart:io';

dynamic routeConfig = {
	// change this base url manually
	"baseUrl": "http://10.0.2.2:8000/api",
	"version": "v1",
	"endpoints": {
		"auth": {
			"login": "/auth/login",
			"register": "/auth/register",
		},
		"user": {
			"products": {
				"recommendation": "/products/recommendation",
				"show": "/products/:id",
			},
			"profile": {
				"index": "/customer/biodatas",
				"store": "/customer/biodatas",
			},
			"banners": {
				"index": "/banners",
			},
			"search": {
				"index": "/search",
			}
		},
		"admin": {
			"products": {
				"store": "/admin/products",
				"index": "/admin/products",
				"destroy": "/admin/products/:id",
			},
			"banners": {
				"store": "/admin/banners",
				"index": "/admin/banners",
				"destroy": "/admin/banners/:id",
			},
			"orders": {
				"index": "/admin/orders",
				"update": "/admin/orders/:id",
			}
		}
	}
};

String baseUrl() {
	return routeConfig['baseUrl'] + Platform.pathSeparator + routeConfig['version'];
}

String generateUrlFromBaseUrl(String url) {
	return baseUrl() + url;
}