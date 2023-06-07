import {
    Card,
    Page,
    Layout,
    Form, 
    FormLayout, 
    Toast, 
    TextField, 
    Button,
    Frame
  } from "@shopify/polaris";
import { TitleBar } from "@shopify/app-bridge-react";
import { useAppQuery, useAuthenticatedFetch } from "../../hooks";
import {useState, useCallback, useEffect} from 'react';


export default function ProductUpdate() {
    const [isLoading, setIsLoading] = useState(true);
   
    const fetch = useAuthenticatedFetch();
    const datas = useAppQuery({            
        url: "/api/email/product-get", 
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

    const emptyToastProps = { content: null };
    const [toastProps, setToastProps] = useState(emptyToastProps);
    const toastMarkup = toastProps.content?(
        <Toast {...toastProps} onDismiss={() => setToastProps(emptyToastProps)} />
    ):null;

    console.log(datas); 
     
    const [formData, setFormData] = useState({
        heading:'',//datas.data.heading,
        bodyContent: '',
    });

     

    const handleInputChange = (field) => (value) => {
        setFormData({ ...formData, [field]: value });
    };

    useEffect(() => {
        if (datas.data) {
          setFormData({
            heading: datas.data.heading,
            bodyContent: datas.data.body_content,
          });
        }
      }, [datas.data]);
   
    const handleSubmit = async () => {
        const response = await fetch("/api/email/product-update", {
            method:'POST',
            body: JSON.stringify(formData),
            headers: { "Content-Type": "application/json" },
        });
        
        if (response.ok) {
            setToastProps({
                content: 'Changes saved successfully',
                error: false,
            });
        }
    };
    if (!datas.data) {
        return <div>Loading...</div>;
      }
 
    return (
        
        <Frame>
        <Page>
        <TitleBar title="Email Template For Product Update" />
        {toastMarkup}
        <Layout>
        <Layout.Section>
            <Card sectioned>
                <Form onSubmit={handleSubmit}>
                    <FormLayout>

                        <TextField
                            label="Heading"
                            value={formData.heading}
                            onChange={handleInputChange('heading')}
                            autoComplete="off"
                        />

                        <TextField
                            label="Body Content"
                            value={formData.bodyContent}
                            onChange={handleInputChange('bodyContent')}
                            multiline={5}
                            autoComplete="off"
                        />

                        <Button submit>Submit</Button>
                    </FormLayout>
                </Form>
            </Card>
        </Layout.Section>
        </Layout>
    </Page>
    </Frame>
    );
    
}
