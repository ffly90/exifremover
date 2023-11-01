package main

import (
	"embed"
	"log"
	"net/http"
	"strings"
)

//go:embed static/*
var content embed.FS

func main() {
	http.HandleFunc("/", serveApp)
	http.ListenAndServe(":8080", nil)

}

func serveApp(w http.ResponseWriter, r *http.Request) {
	path := r.URL.Path
	log.Print(path)
	if path == "/" {
		path = "/index.html"
	}
	// Serve embedded files
	data, err := content.ReadFile("static" + path)
	if err != nil {
		http.NotFound(w, r)
		return
	}

	// Determine the content type based on the file extension.
	contentType := http.DetectContentType(data)
	if strings.HasSuffix(path, ".css") {
		contentType = "text/css"
	} else if strings.HasSuffix(path, ".js") {
		contentType = "application/javascript"
	}
	log.Printf("Path %s hat content type %s", path, contentType)
	w.Header().Set("Content-Type", contentType)

	_, err = w.Write(data)
	if err != nil {
		http.Error(w, "Failed to write response", http.StatusInternalServerError)
	}
}
