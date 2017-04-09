package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	var variables string
	for _, e := range os.Environ() {
		variables += e + "\r\n"
	}

	fmt.Fprintf(w, variables)
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8084", nil)
}
