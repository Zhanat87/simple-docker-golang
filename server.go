package main

import (
	"fmt"
	"net/http"
	"os"
	"github.com/dgrijalva/jwt-go"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	var variables string
	for _, e := range os.Environ() {
		variables += e + "\r\n"
	}

	fmt.Fprintf(w, variables)
}

func jwtToken(w http.ResponseWriter, r *http.Request) {
	// Create a new token object, specifying signing method and the claims
	// you would like it to contain.
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"foo": "bar",
		"nbf": time.Date(2015, 10, 10, 12, 0, 0, 0, time.UTC).Unix(),
	})

	hmacSampleSecret := []byte("secret_key")
	// Sign and get the complete encoded token as a string using the secret
	tokenString, err := token.SignedString(hmacSampleSecret)

	if err != nil {
		fmt.Fprintf(w, err.Error())
	} else {
		fmt.Fprintf(w, tokenString)
	}
}

func main() {
	http.HandleFunc("/", handler)
	http.HandleFunc("/jwt-token", jwtToken)
	http.ListenAndServe(":8084", nil)
}
