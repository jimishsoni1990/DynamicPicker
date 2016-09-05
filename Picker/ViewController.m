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
    NSString * selectedCountry;
    NSString * selectedState;
    NSString * selectedCity;
    
}
@end

@implementation ViewController

@synthesize picker, countrylbl, statelbl, citylbl;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   data = @[
                       @{
                           @"name":@"IN",
                           @"states": @[
                                        @{
                                            @"name": @"GJ",
                                            @"city": @[@"Ahmedabad", @"Baroda"]
                                            },
                                        @{
                                            @"name": @"RJ",
                                            @"city": @[@"Udaipur", @"Jaipur"]
                                            },
                                        @{
                                            @"name": @"MH",
                                            @"city": @[@"Mumbai", @"Pune"]
                                            }
                                        ]
                           },
                       
                       @{
                           @"name":@"US",
                           @"states": @[
                                   
                                       @{
                                           @"name": @"NY",
                                           @"city": @[@"NY1", @"NY2"]
                                           },
                                       @{
                                           @"name": @"NJ",
                                           @"city": @[@"NJ1", @"NJ2"]
                                           },
                                       @{
                                           @"name": @"TX",
                                           @"city": @[@"TX1", @"TX2"]
                                           }
                                       ]
                           }
                       ];
    
    
    // Let's set some defaults
    // Default country
    
    NSDictionary * defaultCountry = [data objectAtIndex:0];
    
    selectedCountry = [defaultCountry valueForKey:@"name"];
    
    // Default state
    
    NSArray * availableStates = [defaultCountry valueForKey:@"states"];
    NSDictionary * defaultState = [availableStates objectAtIndex:0];
    selectedState = [defaultState valueForKey:@"name"];
    
    
    // Default city
    NSArray * availablecity = [defaultState valueForKey:@"city"];
    selectedCity = [availablecity objectAtIndex:0];
    
}

-(int) getCountryCount{
    
    return (int)data.count;
}

-(int) getStateCount{
    
    for(NSDictionary * countryDict in data){
        
        if( [[countryDict valueForKey:@"name"] isEqualToString:selectedCountry] ){
            NSArray* allStates = [countryDict valueForKey:@"states"];
            return (int)[allStates count];
            
        }
    }
    
    return 0;
}

-(int) getCityCount{
    
    for(NSDictionary * countryDict in data){
        
        if( [[countryDict valueForKey:@"name"] isEqualToString:selectedCountry] ){
            NSArray* allStates = [countryDict valueForKey:@"states"];
            
            for(NSDictionary * stateDict in allStates){
                
                if( [[stateDict valueForKey:@"name"] isEqualToString:selectedState] ){
                    return (int)[[stateDict valueForKey:@"city"]count];
                }
                
            }
            
        }
    }
    
    return 0;
}

-(NSString*) getCountryName: (NSInteger)index{
    
    NSDictionary * countryDict = [data objectAtIndex:index];
    return [countryDict valueForKey:@"name"];
    
}

-(NSString*) getStateName: (NSInteger)index{
    
    for(NSDictionary * countryDict in data){
        
        if( [[countryDict valueForKey:@"name"] isEqualToString:selectedCountry] ){
            
            NSArray* allStates = [countryDict valueForKey:@"states"];
            
            NSDictionary * stateDict = [allStates objectAtIndex:index];
            return [stateDict valueForKey:@"name"];
            
            
        }
    }
    
    return @"";
}

-(NSString*) getCityName: (NSInteger)index{
    
    for(NSDictionary * countryDict in data){
        
        if( [[countryDict valueForKey:@"name"] isEqualToString:selectedCountry] ){
            NSArray* allStates = [countryDict valueForKey:@"states"];
            
            for(NSDictionary * stateDict in allStates){
                
                if( [[stateDict valueForKey:@"name"] isEqualToString:selectedState] ){
                    NSArray * allCities = [stateDict valueForKey:@"city"];
                    return [allCities objectAtIndex:index];
                }
                
            }
            
        }
    }
    
    return @"";
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
            
        case 0:
            return [self getCountryCount];
            break;
            
        case 1:
            return [self getStateCount];
            break;
            
            
        case 2:
            return [self getCityCount];
            break;
            
        default:
            break;
            
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
       switch (component) {
        case 0:
               return [self getCountryName: row];
               break;
            
        case 1:
               return [self getStateName: row];
               break;
            
        case 2:
               return [self getCityName: row];
               break;
            
        default:
            break;
    }
    
    return @"No Title";
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSDictionary* countryDict = [data objectAtIndex:[picker selectedRowInComponent:0]];
    selectedCountry = [countryDict valueForKey:@"name"];
    
    //NSLog(@"Country: %@", selectedCountry);
    
    [picker reloadComponent:1]; // reload the 2nd column in picker. i.e state column
    
    selectedState = [self getStateName:[picker selectedRowInComponent:1]];
    
    //NSLog(@"State: %@", selectedState);
    
    [picker reloadComponent:2]; // reload the 3rd column in picker. i.e city column
    
    selectedCity = [self getCityName:[picker selectedRowInComponent:2]];
    
    countrylbl.text = selectedCountry;
    statelbl.text = selectedState;
    citylbl.text = selectedCity;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
