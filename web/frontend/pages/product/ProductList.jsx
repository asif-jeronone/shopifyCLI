import {
    Card,
    Page,
    Layout,
    Form, 
    FormLayout, 
    Toast, 
    TextField, 
    Button,
    Frame,
    DataTable,
    Pagination
  } from "@shopify/polaris";
import { TitleBar } from "@shopify/app-bridge-react";
import { useAppQuery, useAuthenticatedFetch } from "../../hooks";
import {useState, useCallback} from 'react';



export default function ProductList() {
    const [isLoading, setIsLoading] = useState(true);
    const fetch = useAuthenticatedFetch();

    const datas = useAppQuery({            
        url: "/api/product/list", 
        reactQueryOptions: {
            onSuccess: (res) => {
                setIsLoading(false);
                // setFormData({
                //     heading: res.heading,
                //     bodyContent: res.body_content,
                // })
            },
        },
    });   
    console.log(datas); 
    if (!datas.data) {
        return <div>Loading...</div>;
      }
    
      const rows = datas.data.map((item) => [
        item.title,
        item.id,
        item.body_html,
        item.vendor,
        item.product_type,
      ]);
    

    return (
        
        <Frame>
        <Page>
        <TitleBar title="Products" />
      
        <Layout>
        <Layout.Section>
            <Card sectioned>
            <DataTable
                columnContentTypes={[
                  'text',
                  'text',
                  'text',
                  'text',
                  'text',
                ]}
                headings={[
                  'ID',
                  'Product',
                  'Description',
                  'Vendor',
                  'Product Type',
                ]}
                rows={rows}
               
              />

<Pagination
      hasPrevious
      onPrevious={() => {
        console.log('Previous');
      }}
      hasNext
      onNext={() => {
        console.log('Next');
      }}
    />
            </Card>
        </Layout.Section>
        </Layout>
    </Page>
    </Frame>
    );
    
}
