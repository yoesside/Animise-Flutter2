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
		}
	}
};

String baseUrl() {
	return routeConfig['baseUrl'] + Platform.pathSeparator + routeConfig['version'];
}

String generateUrlFromBaseUrl(String url) {
	return baseUrl() + url;
}