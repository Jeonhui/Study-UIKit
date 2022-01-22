enum School: String{
    case primary = "유치원"
    case elemnetary="초등학교"
    case middle="중학교"
    case high="고등학교"
    case college="대학"
    case university="대학교"
    case graduate="대학원"
}

var highestEducation: School = School.university
print(highestEducation.rawValue)
