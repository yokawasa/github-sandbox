package main

// based https://github.com/mchmarny/simple-app
import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	log.Print("Go simple app running...")
	msg := os.Getenv("ENV_MSG")
	if msg == "" {
		msg = ":( ENV_MSG variable not defined"
	}
	fmt.Fprintf(w, "<h1>%s</h1>", msg)
}

func main() {
	flag.Parse()
	log.Print("Go simple app server started...")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
