import re
with open ('BIGQUERY-mysqlsampledatabase.sql', 'r' ) as f:
    content = f.read()
    #content_new = re.sub(r'[+-]?([0-9]*[.])?[0-9]+', r'\1.\2', content, flags = re.M)
    pat=re.compile(r'\'(\d+\.\d{2})\'')
    content_new= pat.sub(r'\1', content)
    print(content_new)

with open('BIGQUERY-mysqlsampledatabase.sql', 'w') as f:
    f.write(content_new)