package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

// Order struct (Model) ...
type mahasiswa struct {
	NoBp     int    `json:"NoBp"`
	Nama     string `json:"Nama"`
	NoHp     string `json:"NoHp"`
	Fakultas string `json:"Fakultas"`
	Jurusan  string `json:"Jurusan"`
	Alamat   struct {
		Jalan     string `json:"Jalan"`
		Kelurahan string `json:"Kelurahan"`
		Kecamatan string `json:"Kecamatan"`
		Kabupaten string `json:"Kabupaten"`
		Provinsi  string `json:"Provinsi"`
	} `json:"Alamat"`
	Nilai []nilai `json:"Nilai"`
}

type nilai struct {
	NoBp       int     `json:"NoBp"`
	IDMatkul   int     `json:"IDMatkul"`
	NamaMatkul string  `json:"NamaMatkul"`
	Nilai      float64 `json:"Nilai"`
	Semester   string  `json:"Semester"`
}

func main() {

	url := "http://localhost:8181/mahasiswa"

	spaceClient := http.Client{
		Timeout: time.Second * 2, // Timeout after 2 seconds
	}

	req, err := http.NewRequest(http.MethodGet, url, nil)

	if err != nil {
		log.Fatal(err)
	}

	req.Header.Set("User-Agent", "spacecount-tutorial")

	res, getErr := spaceClient.Do(req)
	if getErr != nil {
		log.Fatal(getErr)
	}

	if res.Body != nil {
		defer res.Body.Close()
	}

	body, readErr := ioutil.ReadAll(res.Body)

	if readErr != nil {
		log.Fatal(readErr)
	}

	mhsi := mahasiswa{}
	jsonErr := json.Unmarshal(body, &mhsi)
	if jsonErr != nil {
		log.Fatal(jsonErr)
	}

	fmt.Println(mhsi.NoBp)
	fmt.Println(mhsi.Nama)
	fmt.Println(mhsi.NoHp)
	fmt.Println(mhsi.Alamat.Jalan)
	fmt.Println(mhsi.Alamat.Kelurahan)
	fmt.Println(mhsi.Alamat.Kecamatan)
	fmt.Println(mhsi.Alamat.Kabupaten)
	fmt.Println(mhsi.Alamat.Provinsi)

	for _, nilai := range mhsi.Nilai {
		fmt.Println("No BP", nilai.NoBp)
		fmt.Println("ID Mata Kuliah", nilai.IDMatkul)
		fmt.Println("Nama Mata Kuliah", nilai.NamaMatkul)
		fmt.Println("Nilai", nilai.Nilai)
		fmt.Println("Semester", nilai.Semester)
	}

}
