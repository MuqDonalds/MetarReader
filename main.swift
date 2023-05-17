import Foundation
import FoundationNetworking

func main(){
    let metar = Metar()
    let stringURL = "https://codermerlin.academy/wiki/images/1/15/Example-metars.csv"
    let text = metar.readStringFromURL(stringURL: stringURL)

    metar.convertCSV(stringData: text!)

    metar.printStationID()
}

main()
