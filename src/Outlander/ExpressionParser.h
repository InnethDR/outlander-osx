#import <PEGKit/PKParser.h>

enum {
    EXPRESSIONPARSER_TOKEN_KIND_DEBUGLEVEL = 14,
    EXPRESSIONPARSER_TOKEN_KIND_MOVE,
    EXPRESSIONPARSER_TOKEN_KIND_COLON,
    EXPRESSIONPARSER_TOKEN_KIND_RETURNSTMT,
    EXPRESSIONPARSER_TOKEN_KIND_ABORT,
    EXPRESSIONPARSER_TOKEN_KIND_SEMI_COLON,
    EXPRESSIONPARSER_TOKEN_KIND_DOT,
    EXPRESSIONPARSER_TOKEN_KIND_ECHO,
    EXPRESSIONPARSER_TOKEN_KIND_PAUSE,
    EXPRESSIONPARSER_TOKEN_KIND_FORWARD_SLASH,
    EXPRESSIONPARSER_TOKEN_KIND_PUT,
    EXPRESSIONPARSER_TOKEN_KIND_WAITFORRE,
    EXPRESSIONPARSER_TOKEN_KIND_POUND,
    EXPRESSIONPARSER_TOKEN_KIND_MATCHWAIT,
    EXPRESSIONPARSER_TOKEN_KIND_NEXTROOM,
    EXPRESSIONPARSER_TOKEN_KIND_EXITSTMT,
    EXPRESSIONPARSER_TOKEN_KIND_DOLLAR,
    EXPRESSIONPARSER_TOKEN_KIND_WAITFOR,
    EXPRESSIONPARSER_TOKEN_KIND_RESUME,
    EXPRESSIONPARSER_TOKEN_KIND_PERCENT,
    EXPRESSIONPARSER_TOKEN_KIND_SCRIPT,
    EXPRESSIONPARSER_TOKEN_KIND_SEND,
    EXPRESSIONPARSER_TOKEN_KIND_SETVARIABLE,
    EXPRESSIONPARSER_TOKEN_KIND_MATCHRE,
    EXPRESSIONPARSER_TOKEN_KIND_CARET,
    EXPRESSIONPARSER_TOKEN_KIND_GOTO,
    EXPRESSIONPARSER_TOKEN_KIND_GOSUB,
    EXPRESSIONPARSER_TOKEN_KIND_SAVE,
    EXPRESSIONPARSER_TOKEN_KIND_MATCH,
    EXPRESSIONPARSER_TOKEN_KIND_VAR,
};

@interface ExpressionParser : PKParser
        
    @property (nonatomic, strong) NSMutableArray *tokens;
    @property (nonatomic, strong) NSMutableArray *match_tokens;

@end

