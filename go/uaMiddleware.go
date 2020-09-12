package main

import (
	"net/http"
	"strings"

	"github.com/labstack/echo"
)

func passUserAgent(ua string) bool {
	if len(ua) == 0 {
		return true
	}

	uaLow := strings.ToLower(ua)

	if strings.HasPrefix(uaLow, "isucon ") {
		return true
	}
	if strings.Contains(uaLow, "isucon-") {
		return true
	}

	if ua == "Go-http-client/1.1" {
		return true
	}
	return true
}

func customMiddleware(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		ua := c.Request().UserAgent()

		if passUserAgent(ua) {
			// before
			err := next(c)
			// after
			return err
		}
		return c.NoContent(http.StatusServiceUnavailable)
	}
}
