dynamic api = {
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
			}
		}
	}
};