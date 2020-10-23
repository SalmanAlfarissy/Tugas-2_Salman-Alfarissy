package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
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

	getRequest, err := http.Get("http://localhost:8181/mahasiswa")

	if err != nil {
		fmt.Println("Error!")
		fmt.Println(err)
	}

	defer getRequest.Body.Close()

	rawData, err := ioutil.ReadAll(getRequest.Body)

	if err != nil {
		fmt.Println("Error!")
		fmt.Println(err)
	}
	mhsi := []mahasiswa{}

	jsonErr := json.Unmarshal(rawData, &mhsi)

	if jsonErr != nil {
		fmt.Println(jsonErr)
	}

	for i := 0; i < len(mhsi); i++ {
		fmt.Printf("==========================================\n")
		fmt.Println("NoBP : ", mhsi[i].NoBp)
		fmt.Println("Nama : ", mhsi[i].Nama)
		fmt.Println("NoHp : ", mhsi[i].NoHp)
		fmt.Println("Jalan : ", mhsi[i].Alamat.Jalan)
		fmt.Println("Kelurahan : ", mhsi[i].Alamat.Kelurahan)
		fmt.Println("Kecamatan : ", mhsi[i].Alamat.Kecamatan)
		fmt.Println("Kabupaten : ", mhsi[i].Alamat.Kabupaten)
		fmt.Println("Provinsi : ", mhsi[i].Alamat.Provinsi)

		for _, nilai := range mhsi[i].Nilai {
			fmt.Println("No BP", nilai.NoBp)
			fmt.Println("ID Mata Kuliah", nilai.IDMatkul)
			fmt.Println("Nama Mata Kuliah", nilai.NamaMatkul)
			fmt.Println("Nilai", nilai.Nilai)
			fmt.Println("Semester", nilai.Semester)
		}
		fmt.Printf("\n")

	}

}
