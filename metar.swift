import Foundation
import FoundationNetworking


struct MetarRow {
    var raw_text:String
    var station_id:String
    var observation_time:String
    var latitude:String
    var longitude:String
    var temp_c:String
    var dewpoint_c:String
    var wind_dir_degrees:String
    var wind_speed_kt:String
    var wind_gust_kt:String
    var visivility_statute_mi:String
    var altim_in_hg:String
    var sea_level_pressure_mb:String
    var corrected:String
    var auto:String
    var auto_station:String
    var maintenance_indicator_on:String
    var no_signal:String
    var lightning_sensor_off:String
    var freezing_rain_sensor_off:String
    var present_weather_sensor_off:String
    var wx_string:String
    var sky_cover:String
    var cloud_base_ft_agl:String
    var sky_cover1:String
    var cloud_base_ft_agl1:String
    var sky_cover2:String
    var cloud_base_ft_agl2:String
    var sky_cover3:String
    var cloud_base_ft_agl3:String
    var flight_category:String
    var three_hr_pressure_tendency_mb:String
    var maxT_c:String
    var minT_c:String
    var maxT24hr_c:String
    var minT24hr_c:String
    var precip_in:String
    var pcp3hr_in:String
    var pcp6hr_in:String
    var pcp24hr_in:String
    var snow_in:String
    var vert_vis_ft:String
    var metar_type:String
    var elevation_m:String
}

class Metar{
    var columnTitles:[String] = []
    var metar = [MetarRow]()

    //default constructor
    init() {
    }
/*
    //initializer that accepts a series of fields of the expected type
    init() {
    }

    //initializer that accepts a series of strings, one for each field
    init() {
    }

    //initializer that accepts a single string, in a format identical to that in the sample file
    init() {
    }
*/
    
    func readStringFromURL(stringURL:String)-> String!{
        var content : String = ""
        do {
            content = try String(contentsOf:URL(string: stringURL)!)
        }
        catch let error {
            print("Error: \(error)")
        }
        return content
    }
    
    func cleanRows(stringData:String)->[String]{
        var cleanFile = stringData
        cleanFile = cleanFile.replacingOccurrences(of:"\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile.components(separatedBy: "\n")
    }
    
    func cleanFields(oldString:String) -> [String]{
        let delimiter = ","
        let newString = oldString.replacingOccurrences(of: ",", with: ",")
        return newString.components(separatedBy: delimiter)
    }
    
    func convertCSV(stringData:String) -> [MetarRow] {
        let rows = cleanRows(stringData: stringData)
        let columnLine = 5
        if rows.count > 0 {
            columnTitles = cleanFields(oldString: rows[columnLine])
            var i = 0
            for row in rows{
                let fields = cleanFields(oldString: row)

                if(fields.count == columnTitles.count && i > 5){
                    var raw_text = fields[0]
                    var station_id = fields[1]
                    var observation_time = fields[2]
                    var latitude = fields[3]
                    var longitude = fields[4]
                    var temp_c = fields[5]
                    var dewpoint_c = fields[6]
                    var wind_dir_degrees = fields[7]
                    var wind_speed_kt = fields[8]
                    var wind_gust_kt = fields[9]
                    var visivility_statute_mi = fields[10]
                    var altim_in_hg = fields[11]
                    var sea_level_pressure_mb = fields[12]
                    var corrected = fields[13]
                    var auto = fields[14]
                    var auto_station = fields[15]
                    var maintenance_indicator_on = fields[16]
                    var no_signal = fields[17]
                    var lightning_sensor_off = fields[18]
                    var freezing_rain_sensor_off = fields[19]
                    var present_weather_sensor_off = fields[20]
                    var wx_string = fields[21]
                    var sky_cover = fields[22]
                    var cloud_base_ft_agl = fields[23]
                    var sky_cover1 = fields[24]
                    var cloud_base_ft_agl1 = fields[25]
                    var sky_cover2 = fields[26]
                    var cloud_base_ft_agl2 = fields[27]
                    var sky_cover3 = fields[28]
                    var cloud_base_ft_agl3 = fields[29]
                    var flight_category = fields[30]
                    var three_hr_pressure_tendency_mb = fields[31]
                    var maxT_c = fields[32]
                    var minT_c = fields[33]
                    var maxT24hr_c = fields[34]
                    var minT24hr_c = fields[35]
                    var precip_in = fields[36]
                    var pcp3hr_in = fields[37]
                    var pcp6hr_in = fields[38]
                    var pcp24hr_in = fields[39]
                    var snow_in = fields[40]
                    var vert_vis_ft = fields[41]
                    var metar_type = fields[42]
                    var elevation_m = fields[43]

                    var newRow = MetarRow(raw_text: raw_text, station_id: station_id, observation_time: observation_time, latitude: latitude, longitude: longitude, temp_c: temp_c, dewpoint_c: dewpoint_c, wind_dir_degrees: wind_dir_degrees, wind_speed_kt: wind_speed_kt, wind_gust_kt: wind_gust_kt, visivility_statute_mi: visivility_statute_mi, altim_in_hg: altim_in_hg, sea_level_pressure_mb: sea_level_pressure_mb, corrected: corrected, auto: auto, auto_station: auto_station, maintenance_indicator_on: maintenance_indicator_on, no_signal: no_signal, lightning_sensor_off: lightning_sensor_off, freezing_rain_sensor_off: freezing_rain_sensor_off,present_weather_sensor_off: present_weather_sensor_off, wx_string: wx_string, sky_cover: sky_cover, cloud_base_ft_agl: cloud_base_ft_agl, sky_cover1: sky_cover1, cloud_base_ft_agl1: cloud_base_ft_agl1, sky_cover2: sky_cover2,cloud_base_ft_agl2: cloud_base_ft_agl2, sky_cover3: sky_cover3, cloud_base_ft_agl3: cloud_base_ft_agl3, flight_category: flight_category,three_hr_pressure_tendency_mb: three_hr_pressure_tendency_mb,maxT_c: maxT_c,minT_c: minT_c,maxT24hr_c: maxT24hr_c,minT24hr_c: minT24hr_c,precip_in: precip_in,pcp3hr_in: pcp3hr_in,pcp6hr_in: pcp6hr_in,pcp24hr_in: pcp24hr_in,snow_in: snow_in,vert_vis_ft: vert_vis_ft,metar_type: metar_type,elevation_m: elevation_m)

                    
                    metar.append(newRow)
                }
                i += 1
            }
                              
        } else {
            print("No data in file")
        }
        return metar
    }
    
    func getStationIDs()->[String]{        
        var stationIDs = [String]()    

        for metarRow in metar {
            stationIDs.append(metarRow.station_id)
        }

        return stationID
    }

}
                
