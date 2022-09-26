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
				"recommendation": "/products/recommendation"
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