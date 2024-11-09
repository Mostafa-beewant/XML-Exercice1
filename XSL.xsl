<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <body style="display: grid; justify-content : center; align-content: center; ">
                <h2>Bank Statement</h2>
                <p>RIB: <xsl:value-of select="releve/@RIB"/></p>
                <p>Date of Statement: <xsl:value-of select="releve/dateReleve"/></p>
                <p>Balance: <xsl:value-of select="releve/solde"/></p>
                
                <table border="1">
                    <tr><th>Type</th><th>Date</th><th>Amount</th><th>Description</th></tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h3>Total Credit: <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/></h3>
                <h3>Total Debit: <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/></h3>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
