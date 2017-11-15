//
//  ViewController.m
//  rpc_client
//
//  Created by chris on 2017/11/15.
//  Copyright © 2017年 chris. All rights reserved.
//

#import "ViewController.h"

#import <GRPCClient/GRPCCall+ChannelArg.h>
#import <GRPCClient/GRPCCall+Tests.h>
#import <gRPC-client/Server.pbrpc.h>


static NSString * const kHostAddress = @"123.207.38.70:50051";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GRPCCall useInsecureConnectionsForHost:kHostAddress];
    [GRPCCall setUserAgentPrefix:@"gRPC/1.0" forHost:kHostAddress];
    
    HLWGreeter *client = [[HLWGreeter alloc] initWithHost:kHostAddress];

    HLWHelloRequest *request = [HLWHelloRequest message];
    request.name = @"im comming!";
    
    [client sayHelloWithRequest:request handler:^(HLWHelloReply *response, NSError *error) {
        NSLog(@"%@", response.message);
    }];

}


@end
