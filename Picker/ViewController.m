//
//  ViewController.m
//  Picker
//
//  Created by Jimish Soni on 03/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray* data;
    NSArray *country;
    NSArray *state;
    NSArray *city;
    NSString * selectedCountry;
    NSString * selectedState;
    NSString * selectedCity;
    NSDictionary * statesDict;
    NSArray * stateArray;
    NSArray * cityArray;
    
    NSDictionary * defaultCountry;
    NSString * defaultState;
    NSArray * defaultCity;

}
@end

@implementation ViewController

@synthesize picker, countrylbl, statelbl, citylbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   data = @[
                       @{
                           @"name":@"INDIA",
                           @"states": @[
                                        @{
                                            @"GJ": @[@"Ahmedabad", @"Baroda"]
                                            },
                                        @{
                                            @"RJ": @[@"Udaipur", @"Jaipur"]
                                            },
                                        @{
                                            @"MH": @[@"Mumbai", @"Pune"]
                                            }
                                        ]
                           },
                       
                       @{
                           @"name":@"US",
                           @"states": @[
                                   @{
                                       @"NY": @[@"Ahmedabad", @"Baroda"]
                                       },
                                   @{
                                       @"NJ": @[@"Udaipur", @"Jaipur"]
                                       },
                                   @{
                                       @"TX": @[@"Mumbai", @"Pune"]
                                       }
                                   ]
                           }
                       ];
    
    NSDictionary * defaultValues = [data objectAtIndex:0];
    defaultCountry = [defaultValues valueForKey:@"name"];
    
    NSArray * availableStates = [defaultValues valueForKey:@"states"];
    NSDictionary * states = [availableStates objectAtIndex:0];
    defaultState = [states valueForKey:@"GJ"];
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return data.count;
            break;
            
        case 1:
            statesDict = [data valueForKey:selectedCountry];
            stateArray = [statesDict allKeys];
            return stateArray.count;
            break;
            
        case 2:
            cityArray = [data valueForKey:selectedState];
            return cityArray.count;
            break;
            
        default:
            break;
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSArray* allcountries = data;
       switch (component) {
        case 0:
            return [allcountries objectAtIndex:row];
            break;
            
        case 1:
            statesDict = [data valueForKey:selectedCountry];
            stateArray = [statesDict allKeys];
            return [stateArray objectAtIndex:row];
            break;
            
        case 2:
            cityArray = [data valueForKey:selectedState];
            return [cityArray objectAtIndex:row];
            break;
            
        default:
            break;
    }
    
    return @"No Title";
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    selectedCountry = [NSString stringWithFormat:@"%@", [country objectAtIndex:[picker selectedRowInComponent:0] ]];
    
    [picker reloadComponent:1];
    
    selectedState = [NSString stringWithFormat:@"%@", [state objectAtIndex:[picker selectedRowInComponent:1] ]];
    
    [picker reloadComponent:2];
    
    selectedCity = [NSString stringWithFormat:@"%@", [city objectAtIndex:[picker selectedRowInComponent:2] ]];
    
    countrylbl.text = selectedCountry;
    statelbl.text = selectedState;
    citylbl.text = selectedCity;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
