-- Crear el menú personalizado para el juego South Bronx

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

-- Función para crear el menú
local function createMenu()
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
    menuFrame.Position = UDim2.new(0.7, 0, 0.25, 0)
    menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    menuFrame.Parent = ScreenGui

    -- Título del menú
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "South Bronx Mod Menu"
    titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = menuFrame

    -- Botón para autofarm NPCs
    local autofarmButton = Instance.new("TextButton")
    autofarmButton.Text = "Autofarm NPCs"
    autofarmButton.Size = UDim2.new(1, 0, 0.1, 0)
    autofarmButton.Position = UDim2.new(0, 0, 0.1, 0)
    autofarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    autofarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autofarmButton.MouseButton1Click:Connect(function()
        -- Código para autofarm NPCs
        print("Autofarm NPCs activado")
        local npc = game.Workspace:FindFirstChild("NPC") -- Reemplazar con el nombre adecuado
        if npc then
            while true do
                if npc.Health > 0 then
                    npc:TakeDamage(10) -- Daño constante a los NPCs
                end
                wait(1)
            end
        end
    end)
    autofarmButton.Parent = menuFrame

    -- Botón para robos automáticos (banco, ATM)
    local robberyButton = Instance.new("TextButton")
    robberyButton.Text = "Robo Automático"
    robberyButton.Size = UDim2.new(1, 0, 0.1, 0)
    robberyButton.Position = UDim2.new(0, 0, 0.2, 0)
    robberyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    robberyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    robberyButton.MouseButton1Click:Connect(function()
        -- Código para robo automático de bancos y ATMs
        print("Robo automático activado")
        local bank = game.Workspace:FindFirstChild("Bank") -- Reemplazar con el nombre del banco
        if bank then
            -- Simular robo
            local money = Instance.new("IntValue")
            money.Name = "Money"
            money.Value = 1000  -- La cantidad robada
            money.Parent = Player.Backpack
            print("Robo realizado con éxito")
        end
    end)
    robberyButton.Parent = menuFrame

    -- Botón para autofarmear bolsa mágica
    local magicBagButton = Instance.new("TextButton")
    magicBagButton.Text = "Autofarm Bolsa Mágica"
    magicBagButton.Size = UDim2.new(1, 0, 0.1, 0)
    magicBagButton.Position = UDim2.new(0, 0, 0.3, 0)
    magicBagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    magicBagButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    magicBagButton.MouseButton1Click:Connect(function()
        -- Código para autofarmear la bolsa mágica
        print("Autofarm Bolsa Mágica activado")
        local magicBag = game.Workspace:FindFirstChild("MagicBag") -- Reemplazar con el nombre correcto
        if magicBag then
            local bagClone = magicBag:Clone()
            bagClone.Parent = Player.Backpack
            print("Bolsa mágica obtenida")
        end
    end)
    magicBagButton.Parent = menuFrame

    -- Botón para vender automáticamente la bolsa mágica
    local sellMagicBagButton = Instance.new("TextButton")
    sellMagicBagButton.Text = "Vender Bolsa Mágica"
    sellMagicBagButton.Size = UDim2.new(1, 0, 0.1, 0)
    sellMagicBagButton.Position = UDim2.new(0, 0, 0.4, 0)
    sellMagicBagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sellMagicBagButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    sellMagicBagButton.MouseButton1Click:Connect(function()
        -- Código para vender la bolsa mágica
        print("Venta Bolsa Mágica activada")
        local magicBag = Player.Backpack:FindFirstChild("MagicBag") -- Buscar la bolsa en el inventario
        if magicBag then
            -- Vender la bolsa
            magicBag:Destroy()
            local money = Instance.new("IntValue")
            money.Name = "Money"
            money.Value = 500  -- El valor por la venta de la bolsa
            money.Parent = Player.Backpack
            print("Bolsa mágica vendida y dinero agregado")
        end
    end)
    sellMagicBagButton.Parent = menuFrame
end

-- Crear el menú al iniciar
createMenu()
