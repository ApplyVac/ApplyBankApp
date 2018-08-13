#import "Label.h"

#PRAGMA MARK: IMPORT

#import "Types.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation Label

#PRAGMA MARK: INITIAL

+ (NSString *)initialTitle {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Пожалуйста, выберите валюту.";
    default:             return @"Будь-ласка, оберіть валюту.";
  }
}

#PRAGMA MARK: CITY

+ (NSString *)cityTitle {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Выберите город";
    default:             return @"Оберіть місто";
  }
}

+ (NSString *)cityChangeCurr {
  return @"Валюта";
}

+ (NSString *)cityBestBid {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Лучшая цена покупки";
    default:             return @"Краща ціна купівлі";
  }
}

+ (NSString *)cityBestAsk {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Лучшая цена продажи";
    default:             return @"Краща ціна продажу";
  }
}

+ (NSString *)cityAvgBid {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Средняя цена покупки";
    default:             return @"Середня ціна купівлі";
  }
}

+ (NSString *)cityAvgAsk {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Средняя цена продажи";
    default:             return @"Середня ціна продажу";
  }
}

#PRAGMA MARK: BANK

+ (NSString *)bankSortButton {
  switch ([Language main].type) {
    case LanguageTypeRu: return @"Сортировать";
    default:             return @"Сортувати";
  }
}

@end