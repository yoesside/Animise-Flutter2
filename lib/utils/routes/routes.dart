import 'dart:io';

dynamic routeConfig = {
	// change this base url manually
	"baseUrl": "http://192.168.1.5:8000/api",
	"version": "v1",
	"endpoints": {
		"auth": {
			"login": "/auth/login",
			"register": "/auth/register",
		},
		"user": {
			"products": {
				"recommendation": "/products/recommendation"
			},
			"profile": {
				"index": "/customer/biodatas",
				"store": "/customer/biodatas",
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