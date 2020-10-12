<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2 style="text-align:center">Airsoft-shop</h2>
                <h3 style="text-align:center">ИП Реутов Н.Н.</h3>
                <table border="1" style="margin:auto; text-align:center">
                    <tr bgcolor="lightgreen">
                        <td colspan="4" style="font-weight: bold">В наличии</td>
                    </tr>
                    <tr>
                        <th>Название</th>
                        <th>Артикул</th>
                        <th>Цена</th>
                        <th>Фото</th>
                    </tr>
                    <xsl:for-each select="goods/avaliable/good">
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="articool"/></td>
                            <td><xsl:value-of select="price"/> р.</td>
                            <td><img src="/images/{image}" width="300"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr bgcolor="red">
                        <td colspan="4" style="font-weight: bold">Нет в наличии</td>
                    </tr>
                    <xsl:for-each select="goods/non-avaliable/good">
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="articool"/></td>
                            <td><xsl:value-of select="price"/> р.</td>
                            <td><img src="/images/{image}" width="300"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>