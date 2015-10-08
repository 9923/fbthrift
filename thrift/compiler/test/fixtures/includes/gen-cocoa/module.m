/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

/**
* @generated by https://github.com/korovkin/thrift
*/

#import <Foundation/Foundation.h>

#import <thrift/TProtocol.h>
#import <thrift/TApplicationException.h>
#import <thrift/TProtocolException.h>
#import <thrift/TProtocolUtil.h>
#import <thrift/TProcessor.h>
#import <thrift/TObjective-C.h>
#import <thrift/TBase.h>
#import <thrift/TBaseStruct.h>
#import "includes.h"

#import "module.h"


@implementation moduleConstants
+ (void) initialize {
}
@end

@implementation MyStruct

- (instancetype) init
{
  self = [super init];
  self.MyIncludedField = [[[Included alloc] init] autorelease_stub];
  [self.MyIncludedField setMyIntField:5];

  return self;
}

- (id) initWithMyIncludedField: (Included *) MyIncludedField
{
  self = [super init];
  __thrift_MyIncludedField = MyIncludedField;
  __thrift_MyIncludedField_set = YES;
  return self;
}

- (id) initWithCoder: (NSCoder *) decoder
{
  self = [super init];
  if ([decoder containsValueForKey: @"MyIncludedField"])
  {
    __thrift_MyIncludedField = [[decoder decodeObjectForKey: @"MyIncludedField"] retain_stub];
    __thrift_MyIncludedField_set = YES;
  }
  return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder
{
  if (__thrift_MyIncludedField_set)
  {
    [encoder encodeObject: __thrift_MyIncludedField forKey: @"MyIncludedField"];
  }
}

- (Included *) MyIncludedField {
  return __thrift_MyIncludedField;
}

- (void) setMyIncludedField: (Included *) MyIncludedField {
  [self throwExceptionIfImmutable];
  __thrift_MyIncludedField = MyIncludedField;
  __thrift_MyIncludedField_set = YES;
}

- (BOOL) MyIncludedFieldIsSet {
  return __thrift_MyIncludedField_set;
}

- (void) unsetMyIncludedField {
  __thrift_MyIncludedField = nil;
  __thrift_MyIncludedField_set = NO;
}

- (void) read: (id <TProtocol>) inProtocol
{
  NSString * fieldName;
  int fieldType;
  int fieldID;

  [inProtocol readStructBeginReturningName: NULL];
  while (true)
  {
    [inProtocol readFieldBeginReturningName: &fieldName type: &fieldType fieldID: &fieldID];
    if (fieldType == TType_STOP) { 
      break;
    }
    switch (fieldID)
    {
      case 1:
        if (fieldType == TType_STRUCT) {
          Included *fieldValue = [[Included alloc] init];
          [fieldValue read: inProtocol];
          [self setMyIncludedField: fieldValue];
          [fieldValue release_stub];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      default:
        [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        break;
    }
    [inProtocol readFieldEnd];
  }
  [inProtocol readStructEnd];
}

- (void) write: (id <TProtocol>) outProtocol {
  [outProtocol writeStructBeginWithName: @"MyStruct"];
  if (__thrift_MyIncludedField_set) {
    if (__thrift_MyIncludedField != nil) {
      [outProtocol writeFieldBeginWithName: @"MyIncludedField" type: TType_STRUCT fieldID: 1];
      [__thrift_MyIncludedField write: outProtocol];
      [outProtocol writeFieldEnd];
    }
  }
  [outProtocol writeFieldStop];
  [outProtocol writeStructEnd];
}

- (void) validate {
  // check for required fields
}

- (NSString *) description {
  return [[self toDict] description];
}

- (NSDictionary *) toDict {
  NSMutableDictionary *ret = [NSMutableDictionary dictionary];
  ret[@"__thrift_struct_name"] = @"MyStruct";
  if (__thrift_MyIncludedField) {
    ret[@"MyIncludedField"] = [__thrift_MyIncludedField toDict];
  }
  return [ret copy];
}

- (BOOL) makeImmutable {
  const BOOL wasImmutable = [self isImmutable];
  if (!wasImmutable) {
    if (__thrift_MyIncludedField && ![__thrift_MyIncludedField isImmutable]) {
      [__thrift_MyIncludedField makeImmutable];
    }
    [super makeImmutable];
  }
  return YES;
}

- (id) mutableCopyWithZone:(NSZone *)zone {
  MyStruct *newCopy = [[[self class] alloc] init];;
  if (__thrift_MyIncludedField) {
    newCopy->__thrift_MyIncludedField = [self->__thrift_MyIncludedField mutableCopyWithZone:zone];
  }
  newCopy->__thrift_MyIncludedField_set = self->__thrift_MyIncludedField_set;
  return newCopy;
}

@end
