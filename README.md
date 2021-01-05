# aqua_asp
ASP 언어로 VC 패턴을 구현한 Framework

# IIS 모듈
 - IIS rewrite 모듈 설치
 - 참고 [https://www.notion.so/IIS-URL-ReWrite2-0-2b817ab2b3ba4e159347c508aa04d860](https://www.notion.so/IIS-URL-ReWrite2-0-2b817ab2b3ba4e159347c508aa04d860)

# web.config 파일 설정
```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <rewrite>
            <rules>
                <rule name="가져온 규칙 1">
                    <match url="." ignoreCase="false" />
                    <conditions logicalGrouping="MatchAll">
                        <add input="{REQUEST_FILENAME}" matchType="IsFile" ignoreCase="false" negate="true" />
                        <add input="{REQUEST_FILENAME}" pattern="\.(ico|css|png|jpg|gif|js)$" negate="true" />
                    </conditions>
                    <action type="Rewrite" url="index.asp" />
                </rule>
            </rules>
        </rewrite>
        <defaultDocument>
            <files>
                <remove value="iisstart.htm" />
                <remove value="default.aspx" />
                <add value="index.asp" />
            </files>
        </defaultDocument>
		<httpErrors errorMode="Custom" defaultResponseMode="Redirect">
            <remove statusCode="404" subStatusCode="-1" />
            <error statusCode="500" subStatusCode="100" path="/common/error_handler/500-100.asp" responseMode="ExecuteURL" />
        </httpErrors>
    </system.webServer>
</configuration>

```
# 실행구조
 1. /index.asp
  - importFolders()
  - routerHandler()
 2. /common/
  - class.workManager.asp
 3. /controller/
  - 사용자 개발 controller 수행
  
