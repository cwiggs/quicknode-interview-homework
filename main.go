package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type data struct {
    ID   string `json:"id"`
	Hash string `json:"hash"`
}

func PodcastHandler(w http.ResponseWriter, r *http.Request) {
    loadedData := []data{
        {ID: "1", Hash: "329d4feb-c5c0-4de5-b10c-701b44fbec4f"},
    }

	json.NewEncoder(w).Encode(loadedData)
}

func main() {
	http.HandleFunc("/test", PodcastHandler)
	fmt.Println("Starting http server")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
