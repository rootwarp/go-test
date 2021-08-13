package main

import (
	"testing"

	"net/http"
	"net/http/httptest"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestHello(t *testing.T) {
	r := httptest.NewRequest(http.MethodGet, "/hello", nil)
	rr := httptest.NewRecorder()

	e := echo.New()
	c := e.NewContext(r, rr)

	err := hello(c)

	assert.Nil(t, err)
}
