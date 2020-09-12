package main

import (
	"github.com/labstack/echo"
	"net/http"
	"strings"
)

func passUserAgent(ua string) bool {
	if len(ua) == 0 {
		return true
	}

	if strings.HasPrefix(strings.ToLower(ua), "isu") {
		return false // TODO Regex
	}

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
